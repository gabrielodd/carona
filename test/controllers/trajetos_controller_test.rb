require 'test_helper'

class TrajetosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trajeto = trajetos(:one)
  end

  test "should get index" do
    get trajetos_url
    assert_response :success
  end

  test "should get new" do
    get new_trajeto_url
    assert_response :success
  end

  test "should create trajeto" do
    assert_difference('Trajeto.count') do
      post trajetos_url, params: { trajeto: { horario: @trajeto.horario, local_destino: @trajeto.local_destino, local_partida: @trajeto.local_partida, observacao: @trajeto.observacao, passageiros: @trajeto.passageiros, valor: @trajeto.valor } }
    end

    assert_redirected_to trajeto_url(Trajeto.last)
  end

  test "should show trajeto" do
    get trajeto_url(@trajeto)
    assert_response :success
  end

  test "should get edit" do
    get edit_trajeto_url(@trajeto)
    assert_response :success
  end

  test "should update trajeto" do
    patch trajeto_url(@trajeto), params: { trajeto: { horario: @trajeto.horario, local_destino: @trajeto.local_destino, local_partida: @trajeto.local_partida, observacao: @trajeto.observacao, passageiros: @trajeto.passageiros, valor: @trajeto.valor } }
    assert_redirected_to trajeto_url(@trajeto)
  end

  test "should destroy trajeto" do
    assert_difference('Trajeto.count', -1) do
      delete trajeto_url(@trajeto)
    end

    assert_redirected_to trajetos_url
  end
end
