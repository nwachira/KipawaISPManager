{if $paginator}
    <center>
    <nav aria-label="Page navigation" class="pagination-sm">
        <ul class="pagination">
            <li class="page-item {if empty($paginator['prev'])}disabled{/if}">
                <a class="page-link text-white" href="{$paginator['url']}{$paginator['prev']}" aria-label="Previous">
                    <span aria-hidden="true">{Lang::T('Prev')}</span>
                </a>
            </li>
            {foreach $paginator['pages'] as $page}
                <li class="page-item {if $paginator['page'] == $page}active{elseif $page == '...'}disabled{/if}">
                    <a class="page-link text-white" href="{$paginator['url']}{$page}">{$page}</a>
                </li>
            {/foreach}
            <li class="page-item {if $paginator['page'] >= $paginator['count']}disabled{/if}">
                <a class="page-link text-white" href="{$paginator['url']}{$paginator['next']}" aria-label="Next">
                    <span aria-hidden="true">{Lang::T('Next')}</span>
                </a>
            </li>
        </ul>
    </nav>
    </center>
{/if}
