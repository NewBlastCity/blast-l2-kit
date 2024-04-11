import axios from 'axios'
import { privateKeyToAccount } from 'viem/accounts'

export const obtainChallenge = async (contractAddress) => {
  try{
    const challenge = await axios.post(`${process.env.BLAST_POINTS_API}/v1/dapp-auth/challenge`, {
      contractAddress: contractAddress,
      operatorAddress: process.env.OPERATOR_ADDRESS
    })
    return challenge.data
  } catch(err){
    console.log(err)
  }
}

export const obtainToken = async (challengeData, signature) => {
  try{
    const token = await axios.post(`${process.env.BLAST_POINTS_API}/v1/dapp-auth/solve`, {
      challengeData,
      signature
    })
    return token.data
  } catch(err){
    console.log(err)
  }
}

export const getAuth = async (contractAddress) => {
  const challenge = await obtainChallenge(contractAddress)
  const account = privateKeyToAccount(process.env.PRIVATE_KEY)
  const signature =  await account.signMessage({ message: challenge.message})
  const token = await obtainToken(challenge.challengeData, signature)
  return token.bearerToken
} 

