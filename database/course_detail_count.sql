SELECT course.*, max(course_detail_date) as course_detail_count FROM course join course_detail on course_id = cd_course_id 
where course_id=2 group by course_id;