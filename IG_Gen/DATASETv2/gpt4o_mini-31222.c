//GPT-4o-mini DATASET v1.0 Category: Geometric algorithms ; Style: Sherlock Holmes
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAX_POINTS 100

typedef struct {
    double x;
    double y;
} Point;

typedef struct {
    Point vertices[MAX_POINTS];
    int num_vertices;
} Polygon;

void initialize_polygon(Polygon* poly) {
    poly->num_vertices = 0;
}

void add_vertex(Polygon* poly, double x, double y) {
    if (poly->num_vertices < MAX_POINTS) {
        poly->vertices[poly->num_vertices].x = x;
        poly->vertices[poly->num_vertices].y = y;
        poly->num_vertices++;
    }
}

double calculate_area(Polygon* poly) {
    double area = 0.0;
    int j = poly->num_vertices - 1;
    
    for (int i = 0; i < poly->num_vertices; i++) {
        area += (poly->vertices[j].x + poly->vertices[i].x) * (poly->vertices[j].y - poly->vertices[i].y);
        j = i; // j is previous vertex to i
    }
    
    return fabs(area / 2.0);
}

double calculate_perimeter(Polygon* poly) {
    double perimeter = 0.0;

    for (int i = 0; i < poly->num_vertices; i++) {
        int next_index = (i + 1) % poly->num_vertices;
        double dx = poly->vertices[next_index].x - poly->vertices[i].x;
        double dy = poly->vertices[next_index].y - poly->vertices[i].y;
        perimeter += sqrt(dx * dx + dy * dy);
    }

    return perimeter;
}

void display_polygon(Polygon* poly) {
    printf("Polygon vertices:\n");
    for (int i = 0; i < poly->num_vertices; i++) {
        printf("Vertex %d: (%lf, %lf)\n", i + 1, poly->vertices[i].x, poly->vertices[i].y);
    }
}

int main() {
    Polygon my_polygon;
    initialize_polygon(&my_polygon);

    printf("Ah, dear Watson! Let us define our polygon.\n");
    
    // Adding vertices resembling the detective's brilliant mind at work.
    add_vertex(&my_polygon, 0.0, 0.0);
    add_vertex(&my_polygon, 4.0, 0.0);
    add_vertex(&my_polygon, 4.0, 3.0);
    add_vertex(&my_polygon, 0.0, 3.0);
    
    // Displaying the vertices of the polygon, resembling the intricacies of a case file.
    display_polygon(&my_polygon);

    // Calculating the area and perimeter, akin to deducing the essential details of a mystery.
    double area = calculate_area(&my_polygon);
    double perimeter = calculate_perimeter(&my_polygon);

    // Presenting the results with an air of suspense.
    printf("The area of the polygon is: %lf\n", area);
    printf("The perimeter of the polygon is: %lf\n", perimeter);

    printf("Elementary, my dear Watson, the mystery of geometry unfolds before us!\n");

    return 0;
}