
import axios from 'axios';
import 'dotenv/config';
import { getAuth } from './auth.js';
import { v4 as uuidv4 } from 'uuid';
import distributionData from './sample_data.json' assert { type: "json" };

const sendPoints = async (token, uuid, transfers) => {
  try{
    const resp = await axios.put(`${process.env.BLAST_POINTS_API}/v1/contracts/${process.env.CONTRACT_ADDRESS}/batches/${uuid}`,{
      pointType: 'LIQUIDITY',
      transfers,
      secondsToFinalize: 3600 // set to an hour, which is minimum amount Blast allows
    }, {
      headers: {
        'Authorization': `Bearer ${token}`
      }
    })
    return resp.data
  } catch(err){
    console.log(err)
  }
}

/*
  THIS IS CURRENTLY SET TO ITERATE THROUGH SAMPLE_DATA.JSON FILE
  BE SURE TO FORMAT SAMPLE_DATA CORRECTLY TO YOUR NEEDS
*/
const formatTransfers = async() => {
  const transfers = []
  Object.keys(distributionData).forEach(key => {
    transfers.push({
      toAddress: key,
      points: distributionData[key].toFixed(12) // set points value to 12 decimal places
    })
  })
  return transfers
}

const main = async () => {
  const bearer = await getAuth(process.env.CONTRACT_ADDRESS)
  const transfers = await formatTransfers()
  const myUUID = uuidv4();
  const sentBatch = await sendPoints(bearer, myUUID, transfers)
  console.log(sentBatch)
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
