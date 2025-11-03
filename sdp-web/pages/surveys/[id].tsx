import { useRouter } from "next/router";
import { useEffect, useState } from "react";
import { api } from "../../lib/api";

export default function TakeSurvey() {
  const router = useRouter();
  const { id } = router.query as { id?: string };
  const [survey, setSurvey] = useState<any>(null);
  const [answers, setAnswers] = useState<Record<string, number>>({});

  useEffect(() => {
    if (!id) return;
    api.get(`/surveys/${id}`).then((r) => setSurvey(r.data));
  }, [id]);

  if (!survey) return <p>Yukleniyor...</p>;

  return (
    <main style={{ maxWidth: 720, margin: "40px auto", display: "grid", gap: 16 }}>
      <h1>Anket: {survey.scale.title}</h1>
      {survey.scale.items.map((it: any) => (
        <div key={it.id}>
          <p>{it.text}</p>
          <input
            type="number"
            min={it.min || 1}
            max={it.max || 5}
            onChange={(e) =>
              setAnswers({ ...answers, [it.id]: Number(e.target.value) })
            }
          />
        </div>
      ))}
      <button
        onClick={async () => {
          const payload = {
            participant_code: "P1",
            answers: Object.entries(answers).map(([item_id, value]) => ({
              item_id: Number(item_id),
              value
            }))
          };
          await api.post(`/surveys/${id}/responses`, payload);
          location.href = `/surveys/${id}/summary`;
        }}
      >
        Gonder
      </button>
    </main>
  );
}
