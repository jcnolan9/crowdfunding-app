import web3 from './web3'
import CampaignFactory from './build/CampaignFactory.json'

const instance = new web3.eth.Contract(
    JSON.parse(CampaignFactory.interface),
    '0x52fDBEF810e89A477d10E65184c9D0a7cf06c8Fa'
)

export default instance