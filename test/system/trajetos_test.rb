require "application_system_test_case"

class TrajetosTest < ApplicationSystemTestCase
  setup do
    @trajeto = trajetos(:one)
  end

  test "visiting the index" do
    visit trajetos_url
    assert_selector "h1", text: "Trajetos"
  end

  test "creating a Trajeto" do
    visit trajetos_url
    click_on "New Trajeto"

    fill_in "Horario", with: @trajeto.horario
    fill_in "Local destino", with: @trajeto.local_destino
    fill_in "Local partida", with: @trajeto.local_partida
    fill_in "Observacao", with: @trajeto.observacao
    fill_in "Passageiros", with: @trajeto.passageiros
    fill_in "Valor", with: @trajeto.valor
    click_on "Create Trajeto"

    assert_text "Trajeto was successfully created"
    click_on "Back"
  end

  test "updating a Trajeto" do
    visit trajetos_url
    click_on "Edit", match: :first

    fill_in "Horario", with: @trajeto.horario
    fill_in "Local destino", with: @trajeto.local_destino
    fill_in "Local partida", with: @trajeto.local_partida
    fill_in "Observacao", with: @trajeto.observacao
    fill_in "Passageiros", with: @trajeto.passageiros
    fill_in "Valor", with: @trajeto.valor
    click_on "Update Trajeto"

    assert_text "Trajeto was successfully updated"
    click_on "Back"
  end

  test "destroying a Trajeto" do
    visit trajetos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trajeto was successfully destroyed"
  end
end
