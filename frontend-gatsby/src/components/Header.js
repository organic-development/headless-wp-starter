import { Link } from "gatsby"
import PropTypes from "prop-types"
import React from "react"
const Header = ({ query }) => (
  <header
    style={{
      background: `#f4f4f4`,
      marginBottom: `1.45rem`,
    }}
  >
    <div
      style={{
        margin: `0 auto`,
        maxWidth: 960,
        padding: `2rem 1.0875rem`,
      }}
    >
      <Link
        to="/"
        style={{
          color: `white`,
          textDecoration: `none`,
        }}
      >
        <img
          src="https://www.kainos.com/assets/header/Kainos-Logo-841a14fb110ca1f8e9ccee8f06c6cb34baa568b8a004b21d400ed2c4e5fbbb1b.png"
          width={150}
          alt="Kainos Logo"
          style={{marginBottom: 0}}
        />
      </Link>
    </div>
  </header>
)

Header.propTypes = {
  siteTitle: PropTypes.string,
}

Header.defaultProps = {
  siteTitle: ``,
}

export default Header
