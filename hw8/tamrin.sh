#!/bin/bash
touch "not_done_tasks.txt"
touch "done_tasks.txt"
touch "deleted_tasks.txt"
not_done_tasks="not_done_tasks.txt"
done_tasks="done_tasks.txt"
deleted_tasks="deleted_tasks.txt"
add_tasks(){
    if grep -q "^$1$" "$done_tasks"; then
        read -p "This task already add file.do you add this task again?yes=1/no=2 : " choice
        case $choice in
            1) echo $1 >> "$done_tasks"
               echo "date task : $(date '+%Y-%m-%d %H:%M:%S')"  priority: $2 >> "$done_tasks"
               echo "Tak added : $1 / "with priority: $2;;
            2) echo "Tak  not added : $1";;
        esac
    else 
        echo $1 >> "$done_tasks"
        echo "date task : $(date '+%Y-%m-%d %H:%M:%S')"  priority: $2 >> "$done_tasks"
        echo "Tak added : $1 / with priority: $2"
    fi
}
show_done_task(){
    echo Tasks done:
    cat "$done_tasks" 
}
show_not_done_tasks() {
    echo "Tasks not done."
    cat "$not_done_tasks"
}
show_deleted_tasks() {
    echo "Tasks deleted:"
    cat "$deleted_tasks"
}
search_task() {
    if grep -q "^$1$" "$done_tasks"; then
        echo "Task done."
    elif grep -q "^$1$" "$not_done_tasks"; then
        echo "Tasks  not done."
    elif grep -q "^$1$" "$deleted_tasks"; then
        echo "Tasks deleted."
    else 
        echo "task is not any list."
    fi
}
mark_done(){
    grep -i "$1" "$undone_file" >> "$done_file"
    sed -i "/$1/d" "$undone_file"
    echo "Task marked as done: $1"
}
delete_task() {
    grep -i "$1" "$undone_file" >> "$deleted_file"
    sed -i "/$1/d" "$undone_file"
    echo "Task deleted: $1"
}

while true; do
    echo "---- ToDo Menu ----"
    echo "1. Add Task"
    echo "2. Show Tasks Not Done"
    echo "3. Mark Task as Done"
    echo "4. Show Completed Tasks"
    echo "5. Delete Task"
    echo "6. Show Deleted Tasks"
    echo "7. Search Tasks"
    echo "8. Exit"
    read -rp "Enter your choice: " choice
    case $choice in
        1) read -rp "Enter task description: " description
           read -rp "Enter priority (1-3): " priority
           add_tasks "$description" "$priority" ;;
        2) show_not_done_tasks;;
        3) read -rp "Enter task description to mark as done: " done_description
           mark_done "$done_description";;
        4) show_done_task;;
        5) read -rp "Enter task description to delete: " deleted_description
           deleted_tasks "$deleted_description";;
        6) show_deleted;;
        7) read -rp "Enter task description to search: " search_description
           search_tasks "$search_description";;
        8) echo "Exiting ToDo program."
           break;;
        *) echo "Invalid option. Please choose a number from 1 to 8.";;
    esac
done




