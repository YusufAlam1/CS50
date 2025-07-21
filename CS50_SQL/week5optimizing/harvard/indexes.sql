CREATE INDEX "student_enroll" ON "enrollments" ("student_id");
CREATE INDEX "course_enroll" ON "enrollments" ("course_id");
CREATE INDEX "class" ON "courses" ("semester", "department");
CREATE INDEX "course_satisfied" ON "satisfies" ("course_id");

.schema
