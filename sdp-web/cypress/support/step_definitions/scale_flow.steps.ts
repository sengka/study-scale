import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";

Given("Yeni Ölçek sayfasındayım", () => {
  cy.visit("/scales/new");
});

When('Başlık {string} yazarım', (text: string) => {
  cy.get('input[placeholder="Baslik"]').clear().type(text);
});

When('Madde {int} {string} yazarım', (index: number, text: string) => {
  cy.get(`input[placeholder="Madde ${index}"]`).clear().type(text);
});

When('{string} butonuna basarım', (label: string) => {
  cy.contains("button", label).click();
});

Then("URL surveys id sayfasına düşer", () => {
  cy.url().should("match", /\/surveys\/\d+$/);
});

When("Her soruya 4 puan veririm ve {string} butonuna basarım", (label: string) => {
  cy.get('input[type="number"]').each(($el) => {
    cy.wrap($el).clear().type("4");
  });
  cy.contains("button", label).click();
});

Then("Özet sayfasında ortalamalar 4.00 görünür", () => {
  cy.url().should("match", /\/surveys\/\d+\/summary$/);
  cy.contains("ort=4.00").should("exist");
});
