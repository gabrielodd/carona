require "application_system_test_case"

class CampusUffsTest < ApplicationSystemTestCase
  setup do
    @campus_uff = campus_uffs(:one)
  end

  test "visiting the index" do
    visit campus_uffs_url
    assert_selector "h1", text: "Campus Uffs"
  end

  test "creating a Campus uff" do
    visit campus_uffs_url
    click_on "New Campus Uff"

    fill_in "Bairro", with: @campus_uff.bairro
    fill_in "Cep", with: @campus_uff.cep
    fill_in "Endereco", with: @campus_uff.endereco
    fill_in "Nome", with: @campus_uff.nome
    fill_in "Numero", with: @campus_uff.numero
    click_on "Create Campus uff"

    assert_text "Campus uff was successfully created"
    click_on "Back"
  end

  test "updating a Campus uff" do
    visit campus_uffs_url
    click_on "Edit", match: :first

    fill_in "Bairro", with: @campus_uff.bairro
    fill_in "Cep", with: @campus_uff.cep
    fill_in "Endereco", with: @campus_uff.endereco
    fill_in "Nome", with: @campus_uff.nome
    fill_in "Numero", with: @campus_uff.numero
    click_on "Update Campus uff"

    assert_text "Campus uff was successfully updated"
    click_on "Back"
  end

  test "destroying a Campus uff" do
    visit campus_uffs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Campus uff was successfully destroyed"
  end
end
