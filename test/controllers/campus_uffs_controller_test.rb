require 'test_helper'

class CampusUffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campus_uff = campus_uffs(:one)
  end

  test "should get index" do
    get campus_uffs_url
    assert_response :success
  end

  test "should get new" do
    get new_campus_uff_url
    assert_response :success
  end

  test "should create campus_uff" do
    assert_difference('CampusUff.count') do
      post campus_uffs_url, params: { campus_uff: { bairro: @campus_uff.bairro, cep: @campus_uff.cep, endereco: @campus_uff.endereco, nome: @campus_uff.nome, numero: @campus_uff.numero } }
    end

    assert_redirected_to campus_uff_url(CampusUff.last)
  end

  test "should show campus_uff" do
    get campus_uff_url(@campus_uff)
    assert_response :success
  end

  test "should get edit" do
    get edit_campus_uff_url(@campus_uff)
    assert_response :success
  end

  test "should update campus_uff" do
    patch campus_uff_url(@campus_uff), params: { campus_uff: { bairro: @campus_uff.bairro, cep: @campus_uff.cep, endereco: @campus_uff.endereco, nome: @campus_uff.nome, numero: @campus_uff.numero } }
    assert_redirected_to campus_uff_url(@campus_uff)
  end

  test "should destroy campus_uff" do
    assert_difference('CampusUff.count', -1) do
      delete campus_uff_url(@campus_uff)
    end

    assert_redirected_to campus_uffs_url
  end
end
