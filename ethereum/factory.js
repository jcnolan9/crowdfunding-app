import web3 from './web3'
import CampaignFactory from './build/CampaignFactory.json'

const instance = new web3.eth.Contract(
    JSON.parse(CampaignFactory.interface),
    '0x39Cfd8F8540D5BAE4FF152fE3C9c229eA9E2B181'
)

export default instance