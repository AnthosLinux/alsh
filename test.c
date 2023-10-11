#include <stdio.h>
#include <stdlib.h>

int main() {
    // Use getenv to get the value of the USER environment variable
    char *username = getenv("USER");

    // Check if the username is NULL (environment variable not set)
    if (username == NULL) {
        printf("USER environment variable is not set.\n");
    } else {
        // Output the username
        printf("Username: %s\n", username);
    }

    return 0;
}
