local M = {
    'ahmedkhalf/project.nvim',
    config = function()
        require('project_nvim').setup {
            detection_methods = { 'pattern' },
            patterns = { '.projectroot', '.git', '.svn', 'Makefile', 'DESCRIPTION' },
            scope_chdir = 'tab'
        }
    end

}

return M
