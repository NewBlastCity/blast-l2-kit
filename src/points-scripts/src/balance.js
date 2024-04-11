import axios from 'axios'
import 'dotenv/config';
import { getAuth } from './auth.js';

const getPointBalance = async (token, contractAddress) => {
  try{
    const resp = await axios.get(`${process.env.BLAST_POINTS_API}/v1/contracts/${contractAddress}/point-balances`, {
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
  const bearer = await getAuth(process.env.CONTRACT_ADDRESS)
  const pointsData = await getPointBalance(bearer, process.env.CONTRACT_ADDRESS)
  console.log(pointsData.balancesByPointType)
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
