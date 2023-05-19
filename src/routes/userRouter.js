
import express from 'express'
import authenticated from '../middlewares/authenticated.js'
import { listAllUsers, createUser, deleteUser, updateUser }
    from '../controllers/userController.js'

const router = express.Router();

router.get('/user', listAllUsers); //select
router.post('/', createUser); //insert
router.delete('/user', authenticated, deleteUser); //delete
router.put('/user', authenticated, updateUser); //update


export default router








