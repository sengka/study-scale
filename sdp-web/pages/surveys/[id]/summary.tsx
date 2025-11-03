import { useRouter } from "next/router";
import { useEffect, useState } from "react";
import { api } from "../../../lib/api";

export default function Summary() {
  const router = useRouter();
  const { id } = router.query as { id?: string };
  const [rows, setRows] = useState<any[]>([]);

  useEffect(() => {
    if (!id) return;
    api.get(`/surveys/${id}/summary`).then((r) => setRows(r.data));
  }, [id]);

  return (
    <main style={{ maxWidth: 720, margin: "40px auto", display: "grid", gap: 12 }}>
      <h1>Ozet</h1>
      {rows.map((r) => (
        <div key={r.item_id}>
          <b>{r.item_text}</b> → n={r.n}, ort={Number(r.avg).toFixed(2)}
        </div>
      ))}
      {rows.length === 0 && <p>Henuz yanit yok.</p>}
    </main>
  );
}
