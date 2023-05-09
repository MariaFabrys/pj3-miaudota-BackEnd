
import express from 'express'

import {createPerdido, listAllPerdido, deletePerdido, updatePerdido}
 from'../controllers/perdidoController.js'
 
 const router = express.Router();

 
router.get('/', listAllPerdido);
router.post('/', createPerdido); 
router.delete('/', deletePerdido); 
router.put('/', updatePerdido); 


export default router








