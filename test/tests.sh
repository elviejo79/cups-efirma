#!/bin/bash

#set -euo pipefail
#IFS=$'\n\t'

export demo_pdf='/home/agarciafdz/demo.pdf'
export demo_email='agarciafdz@gmail.com'

test_is_mitimbradopy() {
    local result=$(which mitimbrado.py)
    assertEquals "couln't find mitimbrado.py" '/usr/bin/mitimbrado.py' "${result}"
}

test_mitimbradopy_works() {
    local output=$(mitimbrado.py $demo_pdf "[{\"nombre\":\"Alejandro Garcia\",\"email\":\"${demo_email}\"}]")
    local result=$([[ "${output}" =~ ^[0-9]+$ ]]; echo "$?")
    assertTrue "returns a document id" "$result"
}

test_setting_a_printer() {
    local output=$(./setup_printer_send_email $demo_pdf $demo_email $demo_email $demo_email)
    local result=$([[ "${output}" ==  *'now printing timbrado.digital'* ]]; echo "$?")
    assertTrue "printer is idle after sending to print" "$result"
}


# load shUnit2.
. /usr/bin/shunit2
