import { Link, graphql, useStaticQuery } from "gatsby"
import PropTypes from "prop-types"
import React from "react"
import Img from "gatsby-image"

const Header = ({ query }) => {

  const image = useStaticQuery(graphql`
      query {
          file: file(relativePath: { eq: "kainos-logo.png" }) {
              childImageSharp {
                fixed(width: 150, height: 32) {
                  ...GatsbyImageSharpFixed
                }
              }
          }
      }
  `)

  return (<header
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
        <Img fixed={image.file.childImageSharp.fixed} />
      </Link>
    </div>
  </header>);
};

Header.propTypes = {
  siteTitle: PropTypes.string,
}

Header.defaultProps = {
  siteTitle: ``,
}

export default Header
