import express from 'express'
import Mongoose from 'mongoose'
import Todo, { validateTodo } from '../models/todo'

const router = express.Router()

// insert a new data in todo
router.post('/post', async (req, res) => {
    // validate using Joi, with factoring function
    const { error } = validateTodo(req.body)

    // if have any error then return bad request with error else just add the new one
    if (error) {
        return res.status(400).json({
            success: false,
            data: [],
            message: error?.details[0]?.message,
        })
    }

    let todo = new Todo({
        userid: req?.body?.userid,
        title: req?.body?.title,
        completed: req?.body?.completed,
        description: req?.body?.description,
        due: req?.body?.due
    })

    todo = await todo.save()

    return res.json({
        success: true,
        data: todo,
        message: 'New todo adding successful!',
    })
})

// Get request for getting all todo data
router.get('/get', async (_req, res) => {
    // sending all data to response
    const todos = await Todo.find()

    return res.json({
        success: true,
        data: todos,
        message: 'Request successful!',
    })
})

// Get the data about a single todo
router.get('/getbyid/:id', async (req, res) => {
    if (!Mongoose.Types.ObjectId.isValid(req.params.id))
        return res.status(404).json({
            success: false,
            data: [],
            message: 'It is not a valid mongodb id',
        })

    // search using id In mongodb with mongoose
    const todo = await Todo.findById(req.params.id)

    // checking if todo not found then 404 request
    if (!todo)
        return res.status(404).json(
            res.json({
                success: false,
                data: [],
                message: 'There is no data found related to this id!',
            })
        )

    // if found then send the response
    return res.json({
        success: true,
        data: todo,
        message: 'Finding successful!',
    })
})

// Get the data about a single todo
router.get('/userdata/:userid', async (req, res) => {
    // search using id In mongodb with mongoose
    const todo = await Todo.find({ "userid": req.params.userid })
    // checking if todo not found then 404 request
    if (!todo)
        return res.status(404).json(
            res.json({
                success: false,
                data: [],
                message: 'There is no data found related to this id!',
            })
        )

    // if found then send the response
    return res.json({
        success: true,
        data: todo,
        message: 'Finding successful!',
    })
})

// update an existing todo
router.put('/update/:id', async (req, res) => {
    // Validating the user input
    const { error } = validateTodo(req.body)

    if (error) {
        return res.status(400).json({
            success: false,
            data: [],
            message: error?.details[0]?.message,
        })
    }

    // find Id and updated it by mongoose
    const todo = await Todo.findByIdAndUpdate(
        req.params.id,
        {
            title: req?.body?.title,
            completed: req?.body?.completed,
            userid: req?.body?.userid,
            description: req?.body?.description,
            due: req?.body?.due,
        },
        {
            new: true
        }
    )

    // if todo is not available then error or else new updated data send to user
    if (!todo)
        return res.status(404).json({
            success: false,
            data: [],
            message: 'There is no data found related to this id!',
        })

    return res.json({
        success: true,
        data: todo,
        message: 'Update successful!',
    })
})

// delete a todo
router.delete('/delete/:id', async (req, res) => {
    // find an delete the data using moongoose & mongodb
    const deletedTodo = await Todo.findByIdAndRemove(req?.params?.id)

    // checking if todo not found then 404 request & if found then send the response
    if (!deletedTodo)
        return res.status(404).json({
            success: false,
            data: [],
            message: 'There is no data found related to this id!',
        })

    // finally response send with deleted data
    return res.json({
        success: true,
        data: deletedTodo,
        message: 'Delete successful!',
    })
})

export default router