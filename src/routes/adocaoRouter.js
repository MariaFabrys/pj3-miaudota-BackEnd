
import express from 'express'

import {createAdocao, listAllAdocao, deleteAdocao, updateAdocao}
 from'../controllers/adocaoController.js'
 
 const router = express.Router();

 
router.get('/', listAllAdocao);
router.post('/', createAdocao); 
router.delete('/', deleteAdocao); 
router.put('/', updateAdocao); 


export default router








