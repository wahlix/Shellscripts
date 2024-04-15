#!/bin/bash

user_exists() {
    if id -u "$1" >/dev/null 2>&1; then
        return 0
    else
        return 1
    fi
}

change_password() {
    echo "Enter the username of the user you want to change the password for:"
    read username
    if user_exists $username; then
        echo "Enter the new password:"
        read -s password
        echo $username:$password | sudo chpasswd
        echo "Password for $username updated."
    else
        echo "User $username does not exist."
    fi
}

echo "Do you want to add, remove, or change a user's password? Enter 'add', 'remove', or 'change':"
read action

if [ "$action" == "add" ]; then
    echo "Enter the username you want to add:"
    read username
    if user_exists $username; then
        echo "User $username already exists."
    else
        sudo useradd $username
        echo "User $username added."
    fi
elif [ "$action" == "remove" ]; then
    echo "Enter the username you want to remove:"
    read username
    if user_exists $username; then
        sudo userdel $username
        echo "User $username removed."
    else
        echo "User $username does not exist."
    fi
elif [ "$action" == "change" ]; then
    change_password
else
    echo "Invalid action. Please enter 'add', 'remove', or 'change'."
fi

echo "User management operations are complete."