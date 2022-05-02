--JOIN--

Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT * 
FROM `students` 
JOIN `degrees`ON `students`.`degree_id` = `degrees`.`id` 
WHERE `degrees`.`name` = "Corso di Laurea in Economia";

Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT * 
FROM `degrees` 
JOIN `departments` on `degrees`.`department_id` = `departments`.`id` 
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';

Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT * 
FROM `courses` 
JOIN `course_teacher` ON `course_teacher`.`course_id` = `courses`.`id` 
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id` 
WHERE `teachers`.`id` = 44;

Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name`, `students`.`surname`, `degrees`.*, `departments`.`name` AS `department_name`
FROM `students` 
JOIN `degrees` ON `students`.`degree_id` = `degrees`.`id` 
JOIN `departments` ON `degrees`.`department_id` = `departments`.`id` 
ORDER BY `students`.`surname` ASC, `students`.`name` ASC;

Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS `degree_title`, `courses`.*, CONCAT(`teachers`.`surname`, ' ', `teachers`.`name`) AS `teacher` 
FROM `degrees` 
JOIN `courses` ON `courses`.`degree_id` = `degrees`.`id` 
JOIN `course_teacher`ON `courses`.`id` = `course_teacher`.`course_id` 
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id`;

Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT `teachers`.`name`, `teachers`.`name`, `departments`.`name` 
FROM `departments` 
JOIN `degrees` ON `departments`.`id` = `degrees`.`department_id` 
JOIN `courses` ON `degrees`.`id` = `courses`.`degree_id` 
JOIN `course_teacher` ON `courses`.`id` = `course_teacher`.`course_id` 
JOIN `teachers` ON `course_teacher`.`teacher_id` = `teachers`.`id` 
WHERE `departments`.`name` = "Dipartimento di Matematica"
GROUP BY `teachers`.`name`, `teachers`.`surname`;