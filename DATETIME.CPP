#include <iostream.h>
#include <conio.h>

int main() {
    clrscr();

    unsigned int year;
    unsigned char month, day, hour, minute, second, hundredths;

    // Взимане на текущата ДАТА (AH=2Ah)
    asm {
        mov ah, 2Ah
        int 21h
        mov year, cx      // Година (2 байта)
        mov month, dh    // Месец (1 байт)
        mov day, dl       // Ден (1 байт)
    }

    // Взимане на текущото ВРЕМЕ (AH=2Ch)
    asm {
        mov ah, 2Ch
        int 21h
        mov hour, ch      // Часове (1 байт)
        mov minute, cl    // Минути (1 байт)
        mov second, dh    // Секунди (1 байт)
        mov hundredths, dl // Сотни от секундата (1 байт)
    }

    // Извеждане на датата
    cout << "Date: " << (int)day << "-" << (int)month << "-" << (int)year << endl;

    // Извеждане на времето
    cout << "Time: " << (int)hour << ":" << (int)minute << ":" << (int)second << "." << (int)hundredths << endl;

    //getch();
    return 0;
}
