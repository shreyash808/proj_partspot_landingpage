import Head from 'next/head'
import Image from 'next/image'
import { motion } from 'framer-motion'
import Confetti from 'react-confetti'
import { useEffect, useState } from 'react'

function useWindowSize() {
  const [size, setSize] = useState({ width: 0, height: 0 })
  useEffect(() => {
    function handleResize() {
      setSize({ width: window.innerWidth, height: window.innerHeight })
    }
    handleResize()
    window.addEventListener('resize', handleResize)
    return () => window.removeEventListener('resize', handleResize)
  }, [])
  return size
}

export default function Home() {
  const { width, height } = useWindowSize()
  const [showConfetti, setShowConfetti] = useState(false)

  useEffect(() => {
    setShowConfetti(true)
  }, [])

  const taglines = [
    "Jodhpur’s Ultimate Event Booking App – Where Traditions Meet Technology",
    "Get Ready to Party with PartySpot – From Mehandi to Mehfil",
    "Your Event. Our Magic. Coming Soon!"
  ]
  const [tagline, setTagline] = useState(taglines[0])
  useEffect(() => {
    setTagline(taglines[Math.floor(Math.random() * taglines.length)])
  }, [])

  const isMobile = width < 768
  const isTablet = width >= 768 && width < 1024

  return (
    <div style={{
      textAlign: 'center',
      background: 'black',
      color: 'white',
      minHeight: '100vh',
      boxSizing: 'border-box',
      overflowX: 'hidden',
    }}>
      <Head>
        <title>PartyWalah – Coming Soon!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
      </Head>

      {showConfetti && (
        <Confetti
          width={width}
          height={height}
          recycle={false}
          numberOfPieces={isMobile ? 80 : isTablet ? 150 : 250}
          gravity={isMobile ? 0.2 : isTablet ? 0.3 : 0.4}
          wind={isMobile ? 0.01 : 0.02}
        />
      )}

      <div style={{
        padding: isMobile ? '1rem' : isTablet ? '2rem' : '3rem',
        maxWidth: '1200px',
        margin: '0 auto',
      }}>
        <motion.div
          initial={{ opacity: 0, scale: 0.5, y: -50 }}
          animate={{ opacity: 1, scale: 1, y: 0 }}
          transition={{ duration: 1, type: 'spring' }}
          style={{ display: 'flex', justifyContent: 'center', margin: '1rem 0' }}
        >
          <Image
            src="/partyspot-logo.png"
            alt="Party Spot Logo"
            width={200}
            height={200}
            style={{
              width: isMobile ? '100px' : isTablet ? '150px' : '200px',
              height: 'auto',
              maxWidth: '90vw',
            }}
          />
        </motion.div>

        <motion.h1
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.5, duration: 1 }}
          style={{
            fontSize: isMobile ? '2rem' : isTablet ? '2.8rem' : '3.5rem',
            fontWeight: '900',
            textAlign: 'center',
            textShadow: '0 0 10px #ff4d00, 0 0 20px #ff4d00',
            marginTop: '0.5rem',
            lineHeight: 1.2,
          }}
          whileHover={{
            color: '#FFEA00',
            textShadow: '0 0 20px #FFEA00, 0 0 40px #FFEA00',
            scale: 1.05,
          }}
        >
          🎉 <span style={{
            background: 'linear-gradient(90deg, #ff4d00, #ff9e00, #ffea00)',
            WebkitBackgroundClip: 'text',
            WebkitTextFillColor: 'transparent',
            textTransform: 'uppercase',
            letterSpacing: '1px',
          }}>PartyWalah</span> by Partyspot 🎉
        </motion.h1>

        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 1, duration: 1 }}
          style={{
            fontSize: isMobile ? '1rem' : isTablet ? '1.2rem' : '1.4rem',
            marginTop: '1rem',
            fontStyle: 'italic',
            lineHeight: 1.5,
            maxWidth: '90%',
            marginLeft: 'auto',
            marginRight: 'auto',
          }}
          whileHover={{ color: '#ff9e00' }}
        >
          {tagline}
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 2.5, duration: 1 }}
          style={{ marginTop: '2rem', display: 'flex', justifyContent: 'center' }}
        >
          <a
            href="https://www.instagram.com/party_spot_jd/"
            style={{
              padding: isMobile ? '0.6rem 1.4rem' : '1rem 2rem',
              background: '#ff9e00',
              color: 'black',
              borderRadius: '2rem',
              textDecoration: 'none',
              fontWeight: 'bold',
              fontSize: isMobile ? '1rem' : '1.2rem',
              boxShadow: '0 4px 15px rgba(0,0,0,0.2)',
              minWidth: isMobile ? '60vw' : 'auto',
              display: 'inline-block',
              transition: 'transform 0.3s, background 0.3s',
            }}
            onMouseEnter={(e) => {
              e.currentTarget.style.background = '#ffa500'
              e.currentTarget.style.transform = 'scale(1.1)'
            }}
            onMouseLeave={(e) => {
              e.currentTarget.style.background = '#ff9e00'
              e.currentTarget.style.transform = 'scale(1)'
            }}
          >
            Follow Us @ party_spot_jd 💜
          </a>
        </motion.div>
      </div>
    </div>
  )
}
