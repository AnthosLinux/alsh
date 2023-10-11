#ifndef HELP_H_INCLUDED
#define HELP_H_INCLUDED

#pragma once

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<readline/readline.h>
#include<readline/history.h>

// Include

void openHelp()
{
    char* username = getenv("USER");
    printf("\nHello %s.\n",
        username);
    puts(""
        "\nList of Commands supported:"
        "\n>cd"
        "\n>ls"
        "\n>exit"
        "\n>help");

    return;
}

#endif // HELP_H_INCLUDED
