package test

import (
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestVPCModule(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../envs/stage",
	}

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndPlan(t, terraformOptions)
	
	// Validate plan succeeds
	assert.NotNil(t, terraformOptions)
}