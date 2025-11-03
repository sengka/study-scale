Feature: Ölçek oluştur, anket doldur, özeti gör

  Scenario: Tek akış yeşil
    Given Yeni Ölçek sayfasındayım
    When Başlık "Duygu Durum" yazarım
    And Madde 1 "Keyifsiz hissetme" yazarım
    And Madde 2 "Enerji dusuklugu" yazarım
    And "Kaydet & Anket Olustur" butonuna basarım
    Then URL surveys id sayfasına düşer
    When Her soruya 4 puan veririm ve "Gonder" butonuna basarım
    Then Özet sayfasında ortalamalar 4.00 görünür

