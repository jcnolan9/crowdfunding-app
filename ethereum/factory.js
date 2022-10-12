import web3 from './web3'
import CampaignFactory from './build/CampaignFactory.json'

const instance = new web3.eth.Contract(
    JSON.parse(CampaignFactory.interface),
    '0x62B15C788F002376Aaf60c62F1d284DdB42c92b0'
)

export default instance