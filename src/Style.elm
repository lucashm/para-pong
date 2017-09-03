module Style exposing (..)

backgroundStyle : List (String, String)
backgroundStyle =
  [ ("display", "flex")
  , ("justify-content", "center")
  , ("align-items", "center")
  , ("margin-top", "50px")
  , ("flex-direction", "column")
  ]

scoreStyle : List (String, String)
scoreStyle =
  [ ("display", "flex")
  , ("align-items", "center")
  , ("margin-bottom", "10px")
  , ("flex-direction", "row")
  , ("width", "400px")
  , ("justify-content", "space-between")
  ]
