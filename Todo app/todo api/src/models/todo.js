import Mongoose from 'mongoose'
import Joi from 'joi'

const todoSchema = new Mongoose.Schema({
    userid: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
        maxlength: 255,
    },
    title: {
        type: String,
        required: true,
        trim: true,
        minlength: 5,
        maxlength: 255,
    },
    completed: {
        type: Boolean,
        default: false
    },
    due: {
        type: String,
        default: '09-11-2022'
    },
    description: {
        type: String,
        default: ''
    }
})


// joi
const TodoModel = Mongoose.model('Todo', todoSchema)

const JoiSchema = Joi.object({
    userid: Joi.string().min(1).max(255).required(),
    title: Joi.string().min(5).max(255).required(),
    completed: Joi.boolean(),
    due: Joi.string(),
    description: Joi.string(),

})

export const validateTodo = (todo) => JoiSchema.validate(todo)

export default TodoModel