#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
    if [[ $1 ]]
    then
        echo -e "\n$1"
    else
        echo "Welcome to My Salon, how can I help you?"
    fi

    SERVICES_PROVIDE=$($PSQL "SELECT * FROM services")

    echo "$SERVICES_PROVIDE" | while read SERVICE_ID BAR SERVICE
    do
        echo "$SERVICE_ID) $SERVICE"
    done

    read SERVICE_ID_SELECTED

    if [[ $SERVICE_ID_SELECTED =~ [1-6] ]]
    then
        MAKE_APPOINTMENT
    else
        MAIN_MENU "I could not find that service. What would you like today?"
    fi
}

MAKE_APPOINTMENT() {
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_NAME ]]
    then
        echo -e "\nI dont have a record for that phone number, what's your name?"
        read CUSTOMER_NAME

        INSERT_CUSTOMER_INFO=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    fi

    NAME_FORMATTED=$(echo $CUSTOMER_NAME | sed 's/^ +$/"/')


    SERVICE_CHOSEN=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    SERVICE_FORMATTED=$(echo $SERVICE_CHOSEN | sed 's/^ +$/"/')

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    echo -e "\nWhat time would you like your $SERVICE_FORMATTED, $NAME_FORMATTED?"
    read SERVICE_TIME

    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a $SERVICE_FORMATTED at $SERVICE_TIME, $NAME_FORMATTED.\n"
}

MAIN_MENU