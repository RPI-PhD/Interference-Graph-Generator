//GPT-4o-mini DATASET v1.0 Category: Online Examination System ; Style: irregular
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_QUESTIONS 5
#define MAX_OPTION 4
#define MAX_NAME_LENGTH 50

typedef struct {
    char question[256];
    char options[MAX_OPTION][100];
    int correctAnswer; // Store the index of the correct option
} Question;

typedef struct {
    char name[MAX_NAME_LENGTH];
    int score;
} User;

void initializeQuestions(Question questions[]) {
    strcpy(questions[0].question, "What is the capital of France?");
    strcpy(questions[0].options[0], "Berlin");
    strcpy(questions[0].options[1], "Madrid");
    strcpy(questions[0].options[2], "Paris");
    strcpy(questions[0].options[3], "Lisbon");
    questions[0].correctAnswer = 2;

    strcpy(questions[1].question, "Which planet is known as the Red Planet?");
    strcpy(questions[1].options[0], "Earth");
    strcpy(questions[1].options[1], "Mars");
    strcpy(questions[1].options[2], "Jupiter");
    strcpy(questions[1].options[3], "Venus");
    questions[1].correctAnswer = 1;

    strcpy(questions[2].question, "What is the largest ocean on Earth?");
    strcpy(questions[2].options[0], "Atlantic Ocean");
    strcpy(questions[2].options[1], "Indian Ocean");
    strcpy(questions[2].options[2], "Arctic Ocean");
    strcpy(questions[2].options[3], "Pacific Ocean");
    questions[2].correctAnswer = 3;

    strcpy(questions[3].question, "Who wrote 'Romeo and Juliet'?");
    strcpy(questions[3].options[0], "Charles Dickens");
    strcpy(questions[3].options[1], "William Shakespeare");
    strcpy(questions[3].options[2], "Jane Austen");
    strcpy(questions[3].options[3], "Mark Twain");
    questions[3].correctAnswer = 1;

    strcpy(questions[4].question, "What is the smallest prime number?");
    strcpy(questions[4].options[0], "1");
    strcpy(questions[4].options[1], "2");
    strcpy(questions[4].options[2], "3");
    strcpy(questions[4].options[3], "5");
    questions[4].correctAnswer = 1;
}

void displayQuestion(Question q) {
    printf("\n%s\n", q.question);
    for (int i = 0; i < MAX_OPTION; i++) {
        printf("%d. %s\n", i + 1, q.options[i]);
    }
}

int takeExam(Question questions[], User *user) {
    user->score = 0;
    int answer;

    for (int i = 0; i < MAX_QUESTIONS; i++) {
        displayQuestion(questions[i]);
        printf("Your answer (1-%d): ", MAX_OPTION);
        scanf("%d", &answer);

        if (answer - 1 == questions[i].correctAnswer) {
            printf("Correct!\n");
            user->score++;
        } else {
            printf("Wrong! The correct answer was %s.\n", questions[i].options[questions[i].correctAnswer]);
        }
    }
    return user->score;
}

void displayResult(User user) {
    printf("\nExam completed, %s! Your score is: %d out of %d.\n", user.name, user.score, MAX_QUESTIONS);
}

int main() {
    Question questions[MAX_QUESTIONS];
    User user;
    
    initializeQuestions(questions);
    
    printf("Welcome to the Online Examination System\n");
    printf("Enter your name: ");
    fgets(user.name, MAX_NAME_LENGTH, stdin);
    user.name[strcspn(user.name, "\n")] = 0; // Remove new line character

    takeExam(questions, &user);
    displayResult(user);
    
    printf("Thank you for participating! Goodbye.\n");

    return 0;
}