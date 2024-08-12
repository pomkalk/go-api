package internal

import (
	"github.com/stretchr/testify/suite"
	"go-api/math"
	"testing"
)

type TestMathSuite struct {
	suite.Suite
}

func TestMath(t *testing.T) {
	suite.Run(t, &TestMathSuite{})
}

func (s *TestMathSuite) TestSum() {
	a := math.Sum(3, 4)
	s.Equal(7, a, "not equal")
}

func (s *TestMathSuite) TestSub() {
	a := math.Sub(5, 4)
	s.Equal(1, a, "not equal")
}
