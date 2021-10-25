module CommandTests exposing (..)

import Command
import Expect exposing (Expectation)
import Test exposing (..)


suite : Test
suite =
    describe "test commands"
        [ test "parse addPerson command" <|
            \_ ->
                "add{name=Linus Torvald,age=42}"
                    |> Command.parse
                    |> Expect.equal (Ok (Command.addPerson "Linus Torvald" 42))
        , test "parse addPerson command with spaces" <|
            \_ ->
                "add { name = Linus Torvald , age = 42 }"
                    |> Command.parse
                    |> Expect.equal (Ok (Command.addPerson "Linus Torvald" 42))
        , test "parse removePerson command" <|
            \_ ->
                "del  Linus Torvald "
                    |> Command.parse
                    |> Expect.equal (Ok (Command.removePerson "Linus Torvald"))
        ]
