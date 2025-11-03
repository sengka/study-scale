import { useState } from "react";
import { api } from "../../lib/api";

export default function NewScale() {
  const [title, setTitle] = useState("");
  const [items, setItems] = useState(["", ""]);

  const setItem = (i: number, v: string) =>
    setItems(items.map((x, ix) => (ix === i ? v : x)));

  async function submit() {
    const { data: scale } = await api.post("/scales", {
      title,
      description: "MVP",
      items: items.filter(Boolean).map((t) => ({ text: t }))
    });
    const { data: survey } = await api.post("/surveys", { scale_id: scale.id });
    location.href = `/surveys/${survey.id}`;
  }

  return (
    <main style={{ maxWidth: 720, margin: "40px auto", display: "grid", gap: 12 }}>
      <h1>Yeni Olcek</h1>
      <input
        placeholder="Baslik"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
      />
      {items.map((t, i) => (
        <input
          key={i}
          placeholder={`Madde ${i + 1}`}
          value={t}
          onChange={(e) => setItem(i, e.target.value)}
        />
      ))}
      <div style={{ display: "flex", gap: 8 }}>
        <button onClick={() => setItems([...items, ""])}>Madde Ekle</button>
        <button onClick={submit} disabled={!title || !items.some(Boolean)}>
          Kaydet &amp; Anket Olustur
        </button>
      </div>
    </main>
  );
}
