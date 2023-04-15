# MicDrop-Ethglobal-Tokyo-hackathon

# MicDrop dApp

# About
MicDrop is a decentralized live streaming platform built on blockchain technology. The platform aims to provide a user-friendly interface that allows users to browse and search for live streamers easily. It leverages the power of blockchain technology to provide users with secure, censorship-resistant, and transparent live streaming services.

The platform uses several blockchain protocols such as Livepeer, XMTP, EPNS, Lens Protocol, and Polygon to provide users with a seamless experience. Livepeer is used for video transcoding, XMTP is used for secure messaging, EPNS is used for notifications, Lens Protocol is used to build a social graph and display metadata, and Polygon is used for scaling.

This project was developed as part of a hackathon event and is an ongoing project with more features to be added in the future.

# Working Description
The MicDrop dApp consists of several pages, including the home page, stream discovery dashboard, stream page, and marketplace page.

The home page allows users to browse and search for live streamers. Users can create an account on MicDrop dApp using their ENS (Ethereum Name Service) names to map their human-readable names to machine-readable identifiers. Livepeer is used for video transcoding, ensuring that it can be easily streamed on the platform. Mic NFTs are implemented as part of the streamer's profile, allowing them to broadcast their live video streams. Users can purchase gift NFTs from the marketplace to send as tips to streamers using Superfluid payment streaming. Lens Protocol is used to display the currently streaming streamers and their associated metadata.

The stream discovery dashboard is part of the home page and allows users to search and discover live streams based on various criteria such as streamers' names, categories, or tags. Lens Protocol is used to display information about the streamers, including their streaming schedule and past streams.

The stream page displays the live stream of the streamer. XMTP is used for secure messaging between users, allowing them to communicate with each other in real-time during live streams. Streamers can use Mic NFTs to stream live video and audio on the platform. Users can send real-time messages to the streamer during the live stream, and streamers can receive gift NFTs as tips from users using Superfluid payment streaming.

The marketplace page allows users to purchase gift NFTs to send as tips to streamers using Superfluid payment streaming. Lens Protocol is used to display information about the gift NFTs available on the marketplace.

# Protocols Used
Livepeer for video transcoding
XMTP for secure messaging
EPNS for notifications
Lens Protocol for building a social graph and displaying metadata
Polygon for scaling
ENS for user account creation 
Metamask for interacting with the dApp.


# Installation
To install the project dependencies, run the following command:

npm i


Next, create a .env file to connect to the testnet or mainnet. Make sure to update the necessary variables with your own values.

To deploy the contract to the testnet or mainnet using Hardhat, run the following command:


npx hardhat run scripts/deploy.js --network <testnet/mainnet>



After the contract is deployed, you can get the contract address for interaction from the front end.

In a separate terminal, start the server for React:

npm start


Make sure to update any necessary variables or configurations based on your specific setup.
