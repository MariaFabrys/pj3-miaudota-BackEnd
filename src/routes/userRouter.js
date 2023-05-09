
import express from 'express'

import { listAllUsers, createUser, deleteUser, updateUser }
    from '../controllers/userController.js'

const router = express.Router();

router.get('/', listAllUsers); //select
router.post('/', createUser); //insert
router.delete('/', deleteUser); //delete
router.put('/', updateUser); //update


export default router








