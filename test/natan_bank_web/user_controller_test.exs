defmodule NatanBankWeb.UserControllerTest do
  use NatanBankWeb.ConnCase

  alias NatanBank.Users
  alias Users.User

  describe "create/2" do
    test "sucessfully creates an user", %{conn: conn} do
      params = %{
        cep: "12312312",
        email: "bigjohn@fasil.ie",
        nome: "John",
        password: "1231231"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
               "data" => %{"cep" => "12312312", "email" => "bigjohn@fasil.ie", "id" => _id, "nome" => "John"},
               "message" => "User sucessful created"
             } = response
    end

    ######### test of fail case:  ######################

    test "when there are invalid params", %{conn: conn} do
      params = %{
        cep: "123",
        email: "bigjohnasil.ie",
        nome: nil,
        password: "1231231"
      }

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{
        "errors" => %{
          "cep" => ["should be at least 8 character(s)"],
          "email" => ["has invalid format"],
          "nome" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "sucessfully delete an user", %{conn: conn} do
      params = %{
        cep: "12312312",
        email: "bigjohn@fasil.ie",
        nome: "John",
        password: "1231231"
      }

      {:ok, %User{id: id}} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:ok)

      expected_response = %{
        "data" => %{"cep" => "12312312", "email" => "bigjohn@fasil.ie", "id" => 10, "nome" => "John"},
        "message" => "User sucessful deleted"
      }

      assert %{
               "data" => %{"cep" => "12312312", "email" => "bigjohn@fasil.ie", "id" => id, "nome" => "John"},
               "message" => "User sucessful deleted"
             } = response

      assert response = expected_response
    end
  end
end
