
import express from 'express'

import {createPerdido, listAllPerdido, deletePerdido, updatePerdido}
 from'../controllers/perdidoController.js'
 
 const router = express.Router();

 
router.get('/perdido', listAllPerdido);
router.post('/', createPerdido); 
router.delete('/perdido', deletePerdido); 
router.put('/', updatePerdido); 


export default router








