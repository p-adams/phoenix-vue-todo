<template>
    <div>
        <h3>Todos</h3>
        <input
            v-model="todo"
            @keyup.enter="addTodo"
            placeholder="add new todo...">
        <ul>
            <li v-for="todo in todos">
                {{todo.task}} -
                <span
                    @click="completeTask(todo.id)"
                    :class="{completed: !todo.completed}"
                    >
                    {{todo.completed}}
                </span>
                <button @click="deleteTodo(todo.id)">x</button>
            </li>
        </ul>
    </div>
</template>
<script>
export default {
    data() {
        return {
            todos: [],
            todo: ""
        }
    },
    created() {
        this.loadTodos()
    },
    methods: {
        loadTodos() {
            axios.get("api/todos").then(response => {
                this.todos = response.data.data
                console.log(response)
            }).catch(error => {
                console.log(error)
            })
        },
        addTodo() {
            let todo = this.todo.trim()
            console.log(todo)
            axios.post("api/todos", {
                todo: {
                    task: todo,
                    completed: false
                }
            }).then(response => {
                console.log(response)
                this.loadTodos()
            }).catch(error => {
                console.log(error)
            })
            this.todo = ""
        },
        completeTask(id) {
            axios.patch("api/todos/" + id, {
                id: id
            }).then(response => {
                this.loadTodos()
                console.log(response)
            }).catch(error => {
                console.log(error)
            })
        },
        deleteTodo(id) {
            axios.delete("api/todos/" + id).then(response => {
                console.log(response)
                this.loadTodos()
            }).catch(error => {
                console.log(error)
            })
        }
    }


}
</script>
<style>
.completed {
    color: red;
}
</style>