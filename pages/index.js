//index.js is the file for the root route aka '/' route 
import React, { Component } from 'react'
import factory from '../ethereum/factory'

class CampaignIndex extends Component {
   async componentDidMount() {
      const campaigns = await factory.methods.getDeployedCampaigns.call()

      console.log(campaigns)
   }
   

   render() {
      return (
         <div>Campaign Index</div>
      )
   }
}

export default CampaignIndex
//next.js always expects a React component to be exported from the index.js file 