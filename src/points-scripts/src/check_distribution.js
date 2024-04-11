import axios from 'axios'
import 'dotenv/config';
import { getAuth } from './auth.js';

const getDistributionStatus = async (token, batchId) => {
  try{
    const resp = await axios.get(`${process.env.BLAST_POINTS_API}/v1/contracts/${process.env.CONTRACT_ADDRESS}/batches/${batchId}`, {
      headers: {
        'Authorization': `Bearer ${token}`
      }
    })
    return resp.data
  } catch(err){
    console.log(err)
  }
}

const main = async () => {
  const batchId = process.argv[2]
  const bearer = await getAuth(process.env.CONTRACT_ADDRESS)
  const batchData = await getDistributionStatus(bearer, batchId)
  console.log(batchData)
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
