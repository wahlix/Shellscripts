#!/bin/bash

# Ange sökvägen till den fil eller katalog du vill kontrollera
sokvag="/sokvag/till/fil-eller-katalog"

# Kontrollera om filen eller katalogen finns
if [ -e "$sokvag" ]; then
    echo "Filen eller katalogen finns i det aktuella katalogträdet."
else
    echo "Filen eller katalogen finns inte i det aktuella katalogträdet."
fi