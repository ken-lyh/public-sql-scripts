#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
    echo "Please provide an element as an argument."
else

  if [[ $1 =~ ^([1-9]|10)$ ]]
  then

    SEARCH_NUMBER=$($PSQL "SELECT atomic_number, name, symbol, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, types.type FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types ON properties.type_id = types.type_id WHERE atomic_number = $1")

    if [[ -z $SEARCH_NUMBER ]]
    then
        echo I could not find that element in the database.
    else
        echo $SEARCH_NUMBER | while IFS="|" read NUMBER NAME SYMBOL MASS MELTING_POINT BOILING_POINT TYPE
        do
            echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
    fi
  
  elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
  then

    INSERT_FORMATTED=$(echo "$1" | sed 's/^\(0\)/\U\1/')
  
    SEARCH_SYMBOL=$($PSQL "SELECT atomic_number, name, symbol, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, types.type FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types ON properties.type_id = types.type_id WHERE symbol = '$INSERT_FORMATTED'")

    if [[ -z $SEARCH_SYMBOL ]]
    then
        echo I could not find that element in the database.
    else
        echo "$SEARCH_SYMBOL" | while IFS="|" read NUMBER NAME SYMBOL MASS MELTING_POINT BOILING_POINT TYPE
        do
            echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
    fi

  elif [[ $1 =~ ^.{1,40}$ ]]
  then

    INSERT_FORMATTED=$(echo "$1" | sed 's/^\(0\)/\U\1/')
    
    SEARCH_NAME=$($PSQL "SELECT atomic_number, name, symbol, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, types.type FROM elements LEFT JOIN properties USING(atomic_number) LEFT JOIN types ON properties.type_id = types.type_id WHERE name = '$INSERT_FORMATTED'")

    if [[ -z $SEARCH_NAME ]]
    then
        echo I could not find that element in the database.
    else
        echo "$SEARCH_NAME" | while IFS="|" read NUMBER NAME SYMBOL MASS MELTING_POINT BOILING_POINT TYPE
        do
            echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
        done
    fi

  else
      echo I could not find that element in the database.
  fi

fi
