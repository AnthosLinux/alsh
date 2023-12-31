#ifndef COMMANDS_H_INCLUDED
#define COMMANDS_H_INCLUDED

#pragma once

#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<readline/readline.h>
#include<readline/history.h>

#include "color.h"

int ownCmdHandler(char** parsed)
{
    int NoOfOwnCmds = 5, i, switchOwnArg = 0;
    char* ListOfOwnCmds[NoOfOwnCmds];
    char* username;

    ListOfOwnCmds[0] = "exit";
    ListOfOwnCmds[1] = "cd";
    ListOfOwnCmds[2] = "help";
    ListOfOwnCmds[3] = "hello";
    ListOfOwnCmds[4] = "system";
    ListOfOwnCmds[5] = "wit";

    for (i = 0; i < NoOfOwnCmds; i++) {
        if (strcmp(parsed[0], ListOfOwnCmds[i]) == 0) {
            switchOwnArg = i + 1;
            break;
        }
    }

    switch (switchOwnArg) {
    case 1:
        printf("\nEden Linux" + "awda\n");
        exit(0);
    case 2:
    char* home_dir = getenv("HOME");
    // printf();
        if (parsed[1] == NULL) {
          chdir(home_dir);
        } else {
            if (chdir(parsed[1]) != 0) {
                perror("cd");
            }
        }
        return 1;

    case 3:
        openHelp();
        return 1;
    case 4:
        username = getenv("USER");
        printf("\nHello %s.\nMind that this is "
            "not a place to play around."
            "\nUse help to know more..\n",
            username);
        return 1;
    case 5:
      printf(RED_TEXT "\nGoodbye\n" RESET_TEXT);
      return 1;
    default:
        break;
    }

    return 0;
}

#endif // COMMANDS_H_INCLUDED
