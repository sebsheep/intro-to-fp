module CommandTests exposing (..)

import Command
import Expect exposing (Expectation)
import Test exposing (..)


suite : Test
suite =
    describe "test commands"
        [ test "parse addPerson command" <|
            \_ ->
                "add{name=Linus,age=42}"
                    |> Command.parse
                    |> Expect.equal (Ok (Command.addPerson "Linus" 42))
        , test "parse addPerson with hyphen command" <|
            \_ ->
                "add{name=Jean-Michel,age=42}"
                    |> Command.parse
                    |> Expect.equal (Ok (Command.addPerson "Jean-Michel" 42))
        , test "parse addPerson command with spaces in name" <|
            \_ ->
                "add{name=Linus Torvald,age=42}"
                    |> Command.parse
                    |> Expect.equal (Ok (Command.addPerson "Linus Torvald" 42))
        , test "parse addPerson command with spaces everywhere" <|
            \_ ->
                "add { name = Linus Torvald , age = 42 }"
                    |> Command.parse
                    |> Expect.equal (Ok (Command.addPerson "Linus Torvald" 42))
        , test "parse removePerson command" <|
            \_ ->
                "del Linus"
                    |> Command.parse
                    |> Expect.equal (Ok (Command.removePerson "Linus"))
        , test "parse removePerson with space in name command" <|
            \_ ->
                "del  Linus Torvald "
                    |> Command.parse
                    |> Expect.equal (Ok (Command.removePerson "Linus Torvald"))
        ]
