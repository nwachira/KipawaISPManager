<?php

function mpesa_transactions()
{
    global $ui, $admin; // Removed $config since it's not used
    _admin();

    // Pagination setup
    $limit = 100; // Number of transactions per page
    $page = isset($_GET['page']) ? (int)$_GET['page'] : 1; // Get current page, default to 1
    $offset = ($page - 1) * $limit; // Calculate the offset for the query

    // Fetch total transactions count for pagination
    $totalTransactions = ORM::for_table('tbl_mpesa_transactions')->count();
    $totalPages = ceil($totalTransactions / $limit); // Calculate total pages

    // Fetch Mpesa transactions with limit and offset
    $transactions = ORM::for_table('tbl_mpesa_transactions')
        ->order_by_desc('id')
        ->limit($limit)
        ->offset($offset)
        ->find_many();

    // Assign variables to the template
    $ui->assign('t', $transactions);  
    $ui->assign('_title', 'Mpesa Transactions');
    $ui->assign('_system_menu', 'plugin/mpesa_transactions');

    // Fetch current admin info
    $admin = Admin::_info();
    $ui->assign('_admin', $admin);
    
    // Assign pagination info
    $ui->assign('currentPage', $page);
    $ui->assign('totalPages', $totalPages);

    // Display the template
    $ui->display('mpesa_transactions.tpl');
}
