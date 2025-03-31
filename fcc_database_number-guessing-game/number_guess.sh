#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


echo Enter your username:
read USERNAME

SEARCH_USER=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

if [[ -z $SEARCH_USER ]]
then
    echo Welcome, $USERNAME! It looks like this is your first time here.
    INSERT_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")

    if [[ $INSERT_USERNAME == "INSERT 0 1" ]]
    then
      echo Inserted user, $USERNAME
    fi

    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

    if [[ $INSERT_GAME == "INSERT 0 1" ]]
    then
      echo New game created for $USERNAME
    fi
else
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id='$USER_ID'")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id='$USER_ID'")
    
    echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.

fi

SECRET_NUM=$(( RANDOM % 1000 + 1))

echo Guess the secret number between 1 and 1000:
GAME_ID=$($PSQL "SELECT MAX(game_id) FROM games")

GUESSES=0

GUESSING_GAME() {

    if [[ $NUMBER =~ ^[0-9]+$ ]]
    then
      if (( NUMBER > SECRET_NUM ))
      then
          echo "It's lower than that, guess again:"
      elif (( NUMBER < SECRET_NUM ))
      then
          echo "It's higher than that, guess again:"
      fi
    else
        echo That is not an integer, guess again:
    fi

    
    read NUMBER
    GUESSES=$(( GUESSES + 1 ))

    if (( $NUMBER == $SECRET_NUM ))
    then
      INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES)")
      echo You guessed it in $GUESSES tries. The secret number was $SECRET_NUM. Nice job!

    fi

}

GUESSING_GAME

until (( $NUMBER == $SECRET_NUM ))
do
    GUESSING_GAME again
done