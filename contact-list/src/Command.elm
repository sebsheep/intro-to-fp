module Command exposing (Command(..), addPerson, parse, removePerson)

{-| This is the level 2 of this tutorial, you have to complete
the level 1 before doing it!

    The idea here is to interact with the software only with a command
    line interface.

    First, fulfill this file.

    Then, go to the MainCommand module and replace the TODOs

-}

import Parser exposing ((|.), (|=), Parser)


type Command
    = AddPerson Person
    | RemovePerson String


type alias Person =
    { name : String, age : Int }


addPerson : String -> Int -> Command
addPerson name age =
    AddPerson { name = name, age = age }


removePerson : String -> Command
removePerson =
    RemovePerson


parse : String -> Result (List Parser.DeadEnd) Command
parse string =
    Parser.run (parser |. Parser.end) string


parser : Parser Command
parser =
    Parser.oneOf
        [ removePersonParser
        , addPersonParser
        ]


removePersonParser : Parser Command
removePersonParser =
    -- TODO: write this parser! Run elm-test to ensure it works
    Parser.succeed (RemovePerson "FAKE NAME")


addPersonParser : Parser Command
addPersonParser =
    -- TODO: write this parser! Run elm-test to ensure it works
    Parser.succeed (AddPerson { name = "FAKE NAME", age = 4444 })
