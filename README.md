# 🧪 Study Scale – Rails API + Next.js Full Stack Project

**Study Scale**, ölçek tabanlı bir anket sistemi geliştirme senaryosuna dayanır.  
Kullanıcılar belirli bir ölçeğe ait maddeleri (soruları) tanımlar, anket oluşturur, katılımcılar anketi doldurur ve sistem ortalamaları hesaplayarak özet sayfasında gösterir.

---

## 📂 Proje Yapısı

study-scale/
├── sdp_api → Ruby on Rails 8 API (backend)
└── sdp-web → Next.js 14 + TypeScript + Tailwind (frontend)

yaml
Kodu kopyala

---

## ⚙️ Kullanılan Teknolojiler

- **Backend:** Ruby on Rails 8 (API Mode)
- **Database:** SQLite
- **Frontend:** Next.js 14 (TypeScript + Tailwind CSS)
- **E2E Test:** Cypress + Cucumber (BDD)
- **Postman:** API test koleksiyonları
- **GitHub:** Sürüm kontrolü ve teslim

---

## 🚀 Kurulum Adımları

### **Backend – sdp_api**

```bash
cd sdp_api
bundle install
bin/rails db:migrate db:seed
bin/rails s
Sunucu adresi: http://localhost:3000

Temel API Endpoint’leri
Yöntem	Endpoint	Açıklama
POST	/api/v1/scales	Yeni ölçek oluşturur
POST	/api/v1/surveys	Yeni anket oluşturur
POST	/api/v1/surveys/:id/responses	Katılımcı yanıtlarını kaydeder
GET	/api/v1/surveys/:id/summary	Anket ortalamalarını getirir

Frontend – sdp-web
bash
Kodu kopyala
cd sdp-web
pnpm install
pnpm dev --port 3001
Arayüz adresi: http://localhost:3001

.env.local Örneği
bash
Kodu kopyala
NEXT_PUBLIC_API_URL=http://localhost:3000
🧩 Testler – Cypress (BDD)
bash
Kodu kopyala
cd sdp-web
pnpm exec cypress run --browser electron --headless
Cypress Senaryoları
Dosya	Senaryo	Durum
scale_flow.feature	Ölçek oluştur, anket doldur, özet gör	✅ Geçti (Yeşil)
scale_flow_fail.feature	Kasıtlı hatalı ortalama	❌ Başarısız (Kırmızı)

🎥 Test Videoları
cypress/videos/scale_flow.feature.mp4

cypress/videos/scale_flow_fail.feature.mp4

📊 Proje Özeti
Bu uygulama, ölçek geliştirme sürecinin dijital modellemesidir.
Kullanıcı yeni bir ölçek oluşturur, sorular ekler, anket üretir ve yanıtları toplar.
Rails API veriyi yönetir, Next.js arayüzü kullanıcı etkileşimini sağlar.
Cypress testleri, hem başarılı hem de hatalı senaryoları doğrular.

🧠 Kullanım Senaryosu
Kullanıcı Yeni Ölçek sayfasına girer, başlık ve maddeleri oluşturur.

Kaydet & Anket Oluştur butonuna basar → API yeni anketi oluşturur.

Katılımcı 1–5 arası puan verir.

Gönder tuşuyla sonuç kaydedilir.

Özet sayfasında ortalamalar gösterilir.
